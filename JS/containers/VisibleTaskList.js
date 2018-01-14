import { connect } from 'react-redux'
import TaskList from '../components/TaskList'
import { toggleTask } from '../actions'

const getVisibleTasks = (tasks, filter) => {
  switch (filter) {
    case 'SHOW_ALL':
      return tasks
    case 'SHOW_COMPLETED':
      return tasks.filter((t) => t.completed)
    case 'SHOW_ACTIVE':
      return tasks.filter((t) => !t.completed)
  }
}

const mapStateToProps = (state) => {
  return {
    tasks: getVisibleTasks(state.tasks, state.visibilityFilter)
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    onTaskClick: (id) => {
      dispatch(toggleTask(id))
    }
  }
}

const VisibleTaskList = connect(
  mapStateToProps,
  mapDispatchToProps
)(TaskList)

export default VisibleTaskList
