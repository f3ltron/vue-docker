<template>
  <div>hello</div>
</template>

<script>
export default {
  async mounted() {
    try {
      // const res = await fetch(`${process.env.VUE_APP_API_URL}/bonjour`)
      const res = await fetch(`${process.env.VUE_APP_API_URL}/bonjour`, {
        method: 'post',
        // body: JSON.stringify(opts)
      })
      const data = await res.json()
      console.log(data)
    } catch(e) {
      console.log(e)
    }
  }
}
</script>

<style>

</style>