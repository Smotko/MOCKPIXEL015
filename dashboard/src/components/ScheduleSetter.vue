<template>
  <div>
    <p>
      <div v-for="(val, index) in scheduleTimes" class="scheduler-box">
        <strong>{{val.days.join(', ')}}</strong> from <strong>{{val.from}}</strong>  to <strong>{{val.to}}</strong> <strong v-if="val.immobilizer"><i class="fa fa-hand-paper-o" aria-hidden="true" tooltip="Immobilizer engaged"></i></strong> <a href="#" v-on:click="onRemove(index)"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
      </div>
    </p>
    <p class='scheduler-box first'>
      <label v-for="day in days" class="checkbox">
        <input type="checkbox" v-model="day.checked">
        {{day.name}}
      </label>
    </p>
    <p class='scheduler-box'>
      From <input type="time" v-model="formFrom" /> to <input type="time" v-model="formTo" />
    </p>
    <p class='scheduler-box first'>
      <label class="checkbox">
        <input type="checkbox" v-model="formImmobilizer">
        Engage immobilizer <i class="fa fa-hand-paper-o" aria-hidden="true"></i>
      </label>
    </p>
    <p class='scheduler-box'>
      <a href="#" v-on:click="onAdd">Add</a>
    </p>
  </div>
</template>
<script>
export default {
  name: 'schedulesetter',
  data () {
    return {
      days: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'].map((name) => {
        return {name, checked: true}
      }),
      scheduleTimes: this.schedule,
      formFrom: '23:00',
      formTo: '06:00',
      formImmobilizer: false
    }
  },
  props: [
    'schedule'
  ],
  methods: {
    onAdd () {
      const days = this.days.map((val) => {
        if (val.checked) {
          return val.name
        }
      }).filter((val) => { return val })
      if (!days.length || !this.formFrom || !this.formTo) {
        return
      }
      this.scheduleTimes.push({
        days: days,
        from: this.formFrom,
        to: this.formTo,
        immobilizer: this.formImmobilizer
      })
      this.formFrom = '23:00'
      this.formTo = '06:00'
      this.$emit('update', this.scheduleTimes)
    },
    onRemove (index) {
      this.scheduleTimes.splice(index, 1)
      this.$emit('update', this.scheduleTimes)
    }
  }
}
</script>

<style>
.checkbox {
  padding-left: 10px;
}
.scheduler-box {
  padding: 10px;
  color: black;
}
.first {
  padding: 0;
}

</style>
