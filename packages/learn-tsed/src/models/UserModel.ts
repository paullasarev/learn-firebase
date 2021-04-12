import { MaxLength, MinLength, Property, Required } from '@tsed/schema';

export class UserModel {
  @Property()
  @Required()
  id: string;
  @Property()
  @MinLength(3)
  @MaxLength(50)
  firstName: string;
  @Property()
  lastName: string;
}
