<template>
  <div id="page-layout" class="page-layout">
    <header>
      <div class="header-list">
        <div id="date">date: {{myDate.getFullYear()}} / {{ myDate.getMonth() }} / {{ myDate.getDay() }} </div>
        <div id="lastOnline">, &nbsp; last online: 2023 Dec 29 </div>
        <img id="bellIcon" src="../assets/notification.png" alt="">
        <img id="userIcon" src="../assets/user.png" alt="">
      </div>
    </header>
    <div v-if="isSideVis" class="sidebar">
      <div class="sidebar-header">
        <div class="header-name">
          Hola
        </div>
      </div>
      <div class="sidebar-content">
        <LinkSection @link-clicked-section="updateLink" v-bind:id='1' v-bind:name="'System'" v-bind:links=links[0] />
        <div class="last">
          <LinkSection @link-clicked-section="updateLink" v-bind:id='2'  v-bind:name="''" v-bind:links=links[1] />
        </div>
      </div>
    </div>
  
      <button @click="hideBar" id="float-btn" class="float-btn">
        <img src="../assets/left.png" alt="">
      </button>

      <main id="main">
        {{ links[this.slctd_i][this.slctd_j].content.data }}
        <div v-if="slctd_i === 0 && slctd_j === 0" class="graphs">
            <div class="bubble">
              <Bubble :height=bubble_height />
            </div>
            <div class="bar-pie">
              <div class="pie">
                <PieChart :height=pie_height />
              </div>
              <div class="bar">
                <Bar :height=bar_height />
              </div>
            </div>
        </div>
      </main>

  </div>
</template>
<script>
  import LinkSection from './LinkSection.vue'

  import PieChart from './PieChart.vue'
  import Bubble from './BubbleChart.vue'
  import Bar from './BarChart.vue'
  var counter = 1;
  export default {
    name: 'SideBar',
    props: {
    },
    components: {
      LinkSection,
      Bubble,
      PieChart,
      Bar,
    },
    data() {
      return {
        bar_data: [40, 20, 12, 33, 22, 19, 38, 60, 55, 44, 32, 19],
        bar_vis: true,
        bar_height: 400,
        bubble_height: 500,
        pie_height: 1,
        selected: 0, // for link
        slctd_i: 0,
        slctd_j: 0,
        isSideVis: true,
        myDate: new Date(),
        links: [
          [
            {
               id:counter++,
               selected: true,
               name:'Home',
               icon:'fa-solid fa-house',
               content: {
                id:"home",
                data:"Home Page"
               }
              },
            {
              id:counter++, 
              name:'Analysis',
              icon:'fa-solid fa-chart-pie',
              content: {
                id:"Analysis", 
                data:"Analysis"
              }
            },
          ],
          [
            {id:counter++, name:'not Analysis', icon:'fa-solid fa-chart-pie', content:{id:"not analysis", data:'not analysis'}},
            {id:counter++, name:'settings',     icon:'fa-solid fa-hammer', content:{id:"settings", data:'settings'}},
          ],
        ],
      }
    },
    methods: {
      updateContent(id, a, b) {
        //update content
        if(this.links[a][b].content == undefined) {
          return;
        }
          this.slctd_i = a;
          this.slctd_j = b;
      },
      updateLink(id) {
        //update selected
        let a, b = 0;
        for(var i = 0; i < this.links.length; i++ ) {
          for(var j = 0; j < this.links[i].length; j++) {
            this.links[i][j].selected = false;
            if(this.links[i][j].id === id) {
              a = i;
              b = j;
            }
          }
        }
        this.links[a][b].selected = true;
        this.updateContent(id, a, b);
      },
      hideBar() {
        if(this.isSideVis) {
           this.isSideVis = !this.isSideVis
           document.getElementById("float-btn").style = "transform: rotate(180deg);transition-duration: 0.3s;";
           document.getElementById("page-layout").style = "grid-template-columns: 100px 48px auto; grid-template-areas:'header header header''float-btn float-btn main'";
        } else {
           this.isSideVis = true
           document.getElementById("page-layout").style = "grid-template-columns: 300px 48px auto";
           document.getElementById("float-btn").style = "transform: rotate(0deg);transition-duration: 0.3s;";
        }
      }
    }
  }
</script>
<style scoped>
  .page-layout {
    font-family: 'Poppins';
    display: grid;
    height: 100vh;
    grid-template-columns: 300px 48px auto;
    grid-template-rows: 60px auto;
    grid-template-areas:
    "sidebar header header"
    "sidebar float-btn main";
  }

  header {
    border-bottom: 2px solid lightgray;
    grid-area: header;
    padding:15px;
  }
  .sidebar {
    background-color: #3c4b64;
    grid-area: sidebar;
    display: grid;
    grid-template-columns: 1fr;
    grid-template-rows: 60px 1fr;
    grid-template-areas: 
    "s-header"
    "s-content";
  }
  .sidebar-header {
    grid-area: s-header;
    background-color: #303c54;
    color: lightcyan;
    font-size: 24px;
  }
  .header-name {
    text-align: center;
    margin-top: 12px;
  }

  .sidebar-content {
    grid-area: s-content;
    display: flex;
    flex-direction: column;
  }
  .last {
    margin-top: auto;
    margin-bottom : 7px;
  }
  .graphs {
    width: 100%;
    height: inherit;
    display: flex;
    flex-direction: column;
  }

  main {
    overflow: auto;
    grid-area: main;
    padding: 30px 120px 30px 20px; 
  }
  .bubble {
    margin-top:10px;
  }
  .wrapper {
    padding: 100px 0px 0px 0px;
    display:flex;
    flex-direction: row;
  }

  .bar-pie {
    display:flex;
    width: 100%;
    overflow:hidden;
    margin-top: 60px;
  }
  .pie {
    margin-top:50px;
    width:300px;
    height:300px;
  }
  .bar {
    margin-left:60px;
    width:100%;
    overflow:auto;
  }
  

  #bellIcon {
    margin-left: auto;
    margin-right: 15px;
  }

  .header-list{
    display: flex;
  }
  #date {
    font-style: italic;
    font-size: 1.05em;
  }
  #lastOnline {
    font-size: 1.05em;
    font-style: italic;
  }
  .float-btn {
    border:none;
    border-radius: 50%;
    background: none;
    width:48px;
    height:48px;
    margin-top: 30vh;
    margin-left: 20px;
  }

  .float-btn:hover {
    background-color:lightgray;
  }


/* 





  MEDIA




*/

 @media only screen and (max-width: 1400px) {
}
 @media only screen and (max-width: 1200px) {
}
 @media only screen and (max-width: 1000px) {
  
}
 @media only screen and (max-width: 900px) {
  
}
@media only screen and (max-width: 850px) {
}

@media only screen and (min-width: 850px) {
}
</style>
