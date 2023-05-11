const {SecretManagerServiceClient} = require('@google-cloud/secret-manager');
const client = new SecretManagerServiceClient();

exports.getSecret = async (name) => {
    const [version] = await client.accessSecretVersion({
        name: `projects/winedatalake-377223/secrets/${name}/versions/latest`,
    });
    const responsePayload = version.payload.data.toString();
    return responsePayload;
}