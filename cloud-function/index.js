const functions = require('@google-cloud/functions-framework');

functions.http('helloHttptf1', (req, res) => {
  res.send(`Hello ${req.query.name || req.body.name || 'hello world from cloud console'}!`);
});
