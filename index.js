const express = require('express');
const redis = require('redis');

const app = express();
const client = redis.createClient(process.env.REDIS_URL);
client.set('visits', 0);

app.get('/', (req, res) => {
  client.get('visits', (err, visits) => {
    res.send('访问次数 ' + visits);
    client.set('visits', parseInt(visits) + 1);
  });
});

app.listen(8080, () => {
  console.log('监听8080端口中...');
});