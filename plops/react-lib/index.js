export default function (plop) {
  plop.setGenerator('react-lib', {
    description: 'create new react lib',
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
