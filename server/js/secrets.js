const {SecretManagerServiceClient} = require('@google-cloud/secret-manager');
const sM = new SecretManagerServiceClient();

exports.getSecret = function (name) {
    sM.accessSecretVersion({
        name: 'projects/winedatalake-377223/secrets/' + name + '/versions/latest'
    }).then(version => {
        return version.payload.data.toString('utf8');
    });
}