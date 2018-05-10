const router = require('express').Router()
const { dbcon } = require('../../utils/dbcon')

// пример ресурса
// предлагаю всегда проверять rowCount, чтобы на первых порах получать полный фидбэк по ошибкам
// так же ставить статусы и репрезентативный json ответ
// естессно нужно будет после '/' объявлять мидлвары на проверку юзера
module.exports = router
  .get('/', (req, res) => dbcon(
    `SELECT * FROM questions`,
    [],
  ).then(({ rows, rowCount }) => {
    if (rowCount == 0) {
      return res.status(404).json('empty questions')
    }
    res.status(200).send([...rows.map(({
      question_id,
      question_body,
    }) => ({
      question_id,
      question_body,
    }))])
  }))