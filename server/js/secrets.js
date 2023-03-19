const {CLOUD_SQL_CREDENTIALS_SECRET} = process.env;
if (CLOUD_SQL_CREDENTIALS_SECRET) {
  try {
    // Parse the secret that has been added as a JSON string
    // to retrieve database credentials
    return JSON.parse(CLOUD_SQL_CREDENTIALS_SECRET.toString('utf8'));
  } catch (err) {
    throw Error(
      `Unable to parse secret from Secret Manager. Make sure that the secret is JSON formatted: ${err}`
    );
  }
}