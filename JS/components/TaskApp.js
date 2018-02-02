import React from 'react'
import AddTask from '../containers/AddTask'
import VisibleTaskList from '../containers/VisibleTaskList'
import Footer from './Footer'

const TaskApp = () => (
  <div>
    <AddTask />
    <VisibleTaskList />
    <Footer />
  </div>
)

export default TaskApp
