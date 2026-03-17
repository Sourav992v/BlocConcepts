enum Environment{
  dev,
  staging,
  prod
}

Environment getEnvironment(){
  const env = String.fromEnvironment('ENV', defaultValue: 'dev');


  switch(env){
    case 'staging':
      return Environment.staging;

    case 'prod':
      return Environment.prod;

    default:
      return Environment.dev;
  }
}