const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);

module.exports = async (req, res) => {
  // Set CORS headers
  res.setHeader('Access-Control-Allow-Credentials', true);
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,PATCH,DELETE,POST,PUT');
  res.setHeader('Access-Control-Allow-Headers', 'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version');

  // Handle OPTIONS request for CORS
  if (req.method === 'OPTIONS') {
    res.status(200).end();
    return;
  }

  // Only allow POST requests
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  try {
    const { productName, productDescription, amount, currency } = req.body;

    // Validate required fields
    if (!productName || !amount) {
      return res.status(400).json({ 
        error: 'Missing required fields: productName and amount' 
      });
    }

    // Validate amount (must be positive integer)
    if (!Number.isInteger(amount) || amount <= 0) {
      return res.status(400).json({ 
        error: 'Amount must be a positive integer in cents' 
      });
    }

    // Get success and cancel URLs from request or use defaults
    const successUrl = req.body.successUrl || 'https://desdico.com/#/success';
    const cancelUrl = req.body.cancelUrl || 'https://desdico.com/#/failed';

    // Create Stripe Checkout Session
    const session = await stripe.checkout.sessions.create({
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: currency || 'usd',
            product_data: {
              name: productName,
              description: productDescription || '',
            },
            unit_amount: amount,
          },
          quantity: 1,
        },
      ],
      mode: 'payment',
      success_url: successUrl,
      cancel_url: cancelUrl,
      billing_address_collection: 'required',
      customer_email: req.body.customerEmail || undefined,
      metadata: {
        productName: productName,
        amount: amount.toString(),
        currency: currency || 'usd',
        timestamp: new Date().toISOString(),
      },
      // Enable 3D Secure (SCA) for card payments
      payment_intent_data: {
        setup_future_usage: null,
        description: `Purchase: ${productName}`,
        metadata: {
          product: productName,
        },
      },
    });

    // Log success
    console.log('✅ Checkout session created:', session.id);

    // Return session info
    return res.status(200).json({
      sessionId: session.id,
      url: session.url,
    });

  } catch (error) {
    console.error('❌ Error creating checkout session:', error);
    return res.status(500).json({ 
      error: 'Failed to create checkout session',
      details: error.message 
    });
  }
};
