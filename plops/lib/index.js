module.exports = function (plop) {
    plop.setGenerator('lib', {
      description: 'create new lib',
      prompts: [
        {
          type: 'input',
          name: 'name',
          message: 'lib name please',
        },
        {
          type: 'input',
          name: 'description',
          message: 'description please',
        },
      ],
      actions: [

        {
          type: 'addMany',
          destination: '{{kebabCase name}}',
          base: 'templates',
          templateFiles: 'templates/',
          globOptions: {
            dot: true,
          }
        },
      ],
    });
  };
  