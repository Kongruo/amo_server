const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const morgan = require('morgan')

const { port } = require('./config/config')

const app = express()

// api
const questions = require('./routes/api/questions')

app
  .use(morgan('combined'))
  // .use(bodyParser.json()) // нужно использовать частично на ресурсы, где есть body
  .use(cors())
  //api
  .use('/api/questions', questions)

  .listen(process.env.PORT || port, () => {
    console.log(`Server start on port ${port} ...`)
  })

