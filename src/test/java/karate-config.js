function fn() {
    var env = karate.env; // get java system property 'karate.env'
    karate.log('karate.env system property was:', env);

    if (!env) {
        env = 'qa'; // a custom 'intelligent' default795636
    }

    var config = { // base config JSON
            baseURL: 'https://petstore.swagger.io/v2',



                }

    if (env == 'stage') {
                        // over-ride only those that need to be
                        config.baseURL = null;
                        }

    karate.configure('connectTimeout', 5000);
        karate.configure('readTimeout', 300000);
        karate.configure('report', { showLog: false, showAllSteps: false });
        return config;


}