import AWS from 'aws-sdk'

AWS.config.update({
    region: "us-east-2",
    accessKeyId: "AKIAY7NGQZFRW3KEQDXE",//process.env.AWS_ACCESS_KEY_ID,
    secretAccessKey: "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" //process.env.AWS_SECRET_ACCESS_KEY
})

const db = new AWS.DynamoDB.DocumentClient()

const Table = 'MainMenu'

export {
    db,
    Table
}