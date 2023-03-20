const {SecretManagerServiceClient} = require('@google-cloud/secret-manager');
const sM = new SecretManagerServiceClient();

exports.getSecret = async function (name) {
    const [version] = await sM.accessSecretVersion({
        name: 'projects/winedatalake-377223/secrets/' + name + '/versions/latest'
    });
    const payload = version.payload.data.toString('utf8');
    return payload;
}