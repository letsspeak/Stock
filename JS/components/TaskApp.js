import React from 'react'
import AddTask from '../containers/AddTask'
import VisibleTaskList from '../containers/VisibleTaskList'
import TaskAppFooter from './TaskAppFooter'

const TaskApp = () => (
  <div>
    <AddTask />
    <VisibleTaskList />
    <TaskAppFooter />
  </div>
)

export default TaskApp
