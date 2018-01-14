import { combineReducers } from 'redux'
import tasks from './tasks'
import visibilityFilter from './visibilityFilter'

export default combineReducers({
  tasks,
  visibilityFilter
})
