'use strict';
const AWS = require("aws-sdk")
const { v4: uuid } = require("uuid")

AWS.config.update({
  region: process.env.AW_REGION
})

const documentClient = new AWS.DynamoDB.DocumentClient()
const SNS = new AWS.SNS()

module.exports.register = async event => {
  const { name, email } = JSON.parse(event.body)

  const registe_user = await documentClient.put({
    TableName: process.env.DYNAMODB_USERS,
    Item: {
      id: uuid(),
      name,
      email
    }
  }).promise()
  console.log("Usuário criado com sucesso!")

  if(registe_user) {
    await SNS.publish({
      TopicArn: process.env.SNS_USERS_NOTIFICATIONS_TOPIC,
      Message: JSON.stringify({
        message: `O usuario: ${name} com o e-mail: ${email} foi criado com sucesso!`,
        data: { name, email }
      })
    }).promise()
    console.log("Mensagem publicada com sucesso!")
  }

  return {
    statusCode: 201,
    body: JSON.stringify({ message: "Usuário criado com sucesso!" })
  }

}
