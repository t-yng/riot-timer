require('../tags/timer.tag')
require('../tags/timer-button.tag')
const riot = require('riot')

const timerObservable = riot.observable()

riot.mount('timer', {
  time: 0,
  observable: timerObservable
})

riot.mount('#start-button', {
  title: 'START',
  event: 'start',
  observable: timerObservable
})

riot.mount('#stop-button', {
  title: 'STOP',
  event: 'stop',
  observable: timerObservable
})

riot.mount('#reset-button', {
  title: 'RESET',
  event: 'reset',
  observable: timerObservable
})
