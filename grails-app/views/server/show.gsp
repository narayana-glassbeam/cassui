
<%@ page import="com.impetus.ilabs.cassui.Server" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'server.label', default: 'Server')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                   
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="server.cassandraURL.label" default="Cassandra URL" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: serverInstance, field: "cassandraURL")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="server.cassandraVersion.label" default="Cassandra Version" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: serverInstance, field: "cassandraVersion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Cluster name</td>
                            
                            <td valign="top" class="value">${serverInfo.clusterName}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Keyspaces  <g:link action="show" id="${params.id}"><small>show all</small></g:link></td>
                            <td valign="top" class="value">
							<ul>
							<g:each var="t" status="i" in="${serverInfo.keyspaces}">
								<table>
									<li><g:link action="show" id="${params.id}" params="[keyspace:t.key]">${t.key}</g:link></li>
									<g:each var="col" status="k" in="${t.value}">
										<tr>
										<td>
											<g:link action="keyspace" id="${serverInstance.id}" params="[keyspace:t.key,colFamily:col.key]">${col.key}:</g:link> 
										</td>
										<td>
											<table border="1">
											<tr>
											<g:each var="coldetail" status="y" in="${col.value?.sort{a,b-> b.key<=> a.key}}">
												<td>${coldetail.key}: ${coldetail.value.replace("org.apache.cassandra.db.marshal.","")}</td>
											</g:each>
											</tr>
											</table>
										</td>	
									</tr>
									</g:each>
								</table>	
                            </g:each>
							</ul>
							</td>
                        </tr>
                    
                    </tbody>
                </table>

			</div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${serverInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
