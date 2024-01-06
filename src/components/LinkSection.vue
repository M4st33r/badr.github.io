<template>
  <div class="section-name">
    <p class="name">
      {{name}}
    </p>
    <div v-if="name !== ''">
      <div class="arrow" :id=id @click="toggleSection()">
          <img src="../assets/down-arrow.png" alt="down-arrow" v-if="arrow_dir ==='down'" ref="arrow">
          <img src="../assets/down-arrow.png" alt="down-arrow" v-else ref="arrow">
      </div>
    </div>
  </div>
  <div v-if=visible>
    <div v-for="(link) in links" :key="link.id">
      <LinkComponent @link-clicked="update" :icon="link.icon" :isSelected=link.selected :text="link.name" :id="link.id" />
    </div>
  </div>
</template>
<script>
  import LinkComponent from "./LinkComponent"
  export default {
    name: 'LinkSection',
    components: {
      LinkComponent
    },
    props: {
      name: String,
      links: Array,
      id: String,
      bg: String,
    },
    data() {
      return {
        arrow_dir : 'down',
        visible: true,
      }
    },
    methods: {
      update(id) {
        this.$emit('link-clicked-section', id);
      },
      toggleSection() {
        if(this.name === "") return;
        
        console.log(this.arrow_dir);
        console.log(this.id);
        
        if(this.arrow_dir === 'up') {
          document.getElementById(this.id).style = "transform: rotate(0);transition-duration: 0.3s;";
          this.arrow_dir = 'down';
          this.visible = true;
        } else {
           document.getElementById(this.id).style = "transform: rotate(3.142rad);transition-duration: 0.3s;";
          this.visible = false;
          this.arrow_dir = 'up';
        }
      },
    },
    emits: ['link-clicked-section']
  }
</script>
<style scoped>
  .section-name {
    display:flex;
  }
  p {
    color: #a6a7a8;
    padding: 0px 0px 0px 10px;
    font-size: 1.2em;
    margin-top: 10px;
    margin-bottom: 5px;
    font-family: 'Poppins';
  }
  .lnk-sc {
    margin: 2px 0px 5px 10px;
  }
  .arrow {
    position: relative;
    margin-left: auto;
    margin-right:5px;
    margin-top:5px;
    color: white;
    padding: 10px 10px 5px 10px;
    border-radius: 50%;
  }
  .arrow:hover {
    background: #303c54;
  }
  .name {
    width: 100%;
  }
 @media only screen and (max-width: 900px) {
  p {
    font-size: 0.7em;
  }
 }
</style>
