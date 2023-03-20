const {SecretManagerServiceClient} = require('@google-cloud/secret-manager');
const sM = new SecretManagerServiceClient();

module.getSecret = async function (name) {
    let [version] = await sM.accessSecretVersion({
        name: 'projects/winedatalake-377223/secrets/' + name + '/versions/latest'
    });
    return version.payload.data.toString();
}