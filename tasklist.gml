<gm:page title="Google Lists" class="tasksTheme" css="http://tasklist.googlemashups.com/resources/tasklist.css" authenticate="true">
 
  <!-- The advanced task list application is a simple task list that stores
       tasks per user in the ${user} feed. The application uses hierarchy to 
       display projects and tasks contained in each of those projects. The date
       picker control is also featured in this app.
       @author: GME Team
  --> 

<style>
.tasks .gm-item {
  padding:5px !important;
  font-size:85%;
  border-bottom:1px solid #e6e6e6;
}
</style>

<!-- Table for the header -->
<table width="100%" >
  <tr>
    <td valign="top">
      <div id="header" style="padding-left:15px;padding-top:10px;">
       <div id="logo">
       </div>
      </div>
     </td>
   </tr>
</table>

<table width="100%" >
  <tr valign="top" >
    <td width="200" class="sideTabs" style="padding-left:15px;padding-top:20px;">
      <gm:list id="projList" data="${user}/projects2" template="projForm">
        <gm:handleEvent event="select" 
          execute="document.getElementById('message').style.display = event.entry ? 'none' : 'block';"/>
      </gm:list>
    </td>
    <td style="padding-right:15px;padding-top:20px;">
      <div id="taskContainer">
        <gm:list id="taskList" data="${projList}/tasks" template="taskForm"/>
       </div>
    </td>
  </tr>
</table>

<gm:template id="projForm">
  <gm:create label="New Task List"/>
   <div style="padding-top:10px;">
   <table width="100%">
     <tbody repeat="true">
       <tr>
         <td width="160" style="padding:5px:"><gm:text style="width:140px;color:blue;text-decoration:underline;" ref="atom:title"/></td>
         <td width="40" style="padding:5px:" nowrap="true"><gm:editButtons class="gm-select-only"/></td>
       </tr>
     </tbody>
    </table>
  </div>
</gm:template>

<gm:template id="taskForm">
  <table width="100%">
    <tr>
      <td colspan="7" height="30px" style="background-color:#C3D9FF;padding:5px;height:30px;-moz-border-radius: 4 4 0 0;">
        <gm:create label="New Task"/>
      </td>
    </tr>
   </table>
   <table width="100%">
      <tr width="100%">
        <td width="20" class="gm-header"></td>
          <td width="75" class="gm-header">Done</td>
          <td width="100" class="gm-header">Due</td>
          <td class="gm-header">Task</td>
          <td width="150" nowrap="true" class="gm-header">Assigned To</td>
          <td width="100" class="gm-header">Priority</td>
          <td width="60" class="gm-header"></td>
     </tr>
     <tbody repeat="true" width="100%">
       <tr class="tasks">
         <td width="20" valign="top" align="left" class="gm-item"><gm:toggle/></td>
         <td width="75" align="left" class="gm-item"><gm:checkbox ref="gd:status/@value"/></td>
         <td width="100" align="left" class="gm-item"><gm:date ref="gd:when/@startTime"/></td>
         <td class="gm-item"><gm:text ref="atom:title" gm-focus="true"/></td>
         <td width="150" class="gm-item"><gm:text ref="gd:assignedTo/@email"/></td>
         <td width="100" class="gm-item"><gm:rating ref="gd:priority"/></td>
         <td width="60" class="gm-item"><gm:editButtons/></td>
        </tr>
        <tr class="gm-toggled" width="100%">
          <td colspan="7" class="gm-item"><gm:textarea ref="atom:content" style="white-space:pre"/></td>
        </tr>
     </tbody>
  </table>
  <div id="message" style="text-align:center;color:gray;margin-top:4em;">Click a list to see the tasks or create a new task list</div>

   <table width="100%" style="margin-top:4em" >
    <tr>
     <td colspan="7" style="background-color:#C3D9FF;padding:5px;height:30px;-moz-border-radius: 0 0 4 4" >
        <gm:create label="New Task"/>
     </td>
    </tr>
  </table>
</gm:template>

</gm:page>
