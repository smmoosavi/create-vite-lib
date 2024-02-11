import { kebabCase } from 'change-case';

export default function (plop) {
  plop.setGenerator('react-lib', {
    description: 'create new react lib',
    prompts: [
      {
        type: 'input',
        name: 'name',
        message: 'lib name please',
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
      ({ name }) => `

Done. Now run:

  cd ${kebabCase(name)}
  git init; git add .; git commit -m "initial commit"
  pnpm install
  pnpm build
`
    ],
  });
};
