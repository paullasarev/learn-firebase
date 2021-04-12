import { Controller, Get } from '@tsed/common';
import { UserModel } from '../models/UserModel';
import { Returns } from '@tsed/schema';

@Controller('/users')
export class UsersController {
  @Get('/')
  @Returns(200, Array).Of(UserModel).Description('Success')
  get(): UserModel[] {
    return [
      { id: '1', firstName: 'John', lastName: 'Dow' },
      { id: '2', firstName: 'Sarah', lastName: 'Smith' },
      { id: '2', firstName: 'Ivan', lastName: 'Kim' },
    ];
  }
}
