<gm:page title="Edit Park Points" authenticate="true">

  <!-- Here we create the list to display the data we save in 
        the $app/pts feed -->

  <gm:list id="myList" data="${app}/points" template="pointsTemplate"/>

  <!-- Here we create the template that contains edit
        and delete buttons. We also specify a create button to add
        data to the feed. -->

  <gm:template id="pointsTemplate">
    <table>
      <tbody repeat="true">
        <tr>
          <td><gm:text ref="gd:title"/></td>
          <td><gm:textarea ref="gd:description"/></td>
          <td><gm:number ref="gd:lon"/></td>
          <td><gm:number ref="gd:lat"/></td>
          <td><gm:editButtons /></td>
        </tr>
      </tbody>
    </table>
    <gm:create label="Create new entry"/>
  </gm:template>  

</gm:page>