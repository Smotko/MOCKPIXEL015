import Vue from 'vue'
import Dashboard from '@/components/Dashboard'

describe('Hello.vue', () => {
  it('should render dashboard page', () => {
    const Constructor = Vue.extend(Dashboard)
    const vm = new Constructor().$mount()
    expect(vm.msg).to.equal('Welcome to Your Vue.js App')
  })
})
