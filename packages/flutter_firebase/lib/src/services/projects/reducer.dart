import 'package:flutter_firebase/src/services/projects/actions.dart' show SetProjectsAction;
import 'package:flutter_firebase/src/services/projects/types.dart' show ProjectState;

initialState() { return ProjectState([]); }

ProjectState projectsReducer(ProjectState nstate, action) {
  ProjectState state = nstate ?? initialState();

  if (action is SetProjectsAction) {
    ProjectState newState = ProjectState(action.projects);
    return newState;
  }
  
  return state;
}
