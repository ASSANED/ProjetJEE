<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../header.jsp"></jsp:include>
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                    <div class="card-header card-header-primary">
                  <h4 class="card-title">Edit Profile</h4>
                  <p class="card-category">Complete your profile</p>
                </div>
                <div class="card-body">
                  <form method="post" action=User>
                   
                      <div class="col-md-5">
                        <div class="form-group">
                          <label class="bmd-label-floating">Company (disabled)</label>
                          <input type="text" class="form-control" disabled>
                        </div>
                      </div>
                     	
                      <div class="col-md-3">
                        <div class="form-group">
                          <label class="bmd-label-floating">Nom</label>
                          <c:if test="${userG !=null }">
                          <input type="hidden" name="id" class="form-control" value='${userG.id  }'>
                          </c:if>                         
                          <input type="text" name="nom" class="form-control" value='<c:if test="${userG !=null }">${userG.nom  }</c:if>'>
                          
                        </div>
                      </div>
                      <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Prenom</label>
                          <input type="text" name="prenom" class="form-control" value='<c:if test="${userG !=null }">${userG.prenom  }</c:if>'>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Email</label>
                          <input type="email" name="email" class="form-control" value='<c:if test="${userG !=null }">${userG.email  }</c:if>'>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Password</label>
                          <input type="password" name="password" class="form-control" value='<c:if test="${userG !=null }">${userG.password  }</c:if>'>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Etat</label>
                          <input type="text" name="etat" class="form-control" value='<c:if test="${userG !=null }">${userG.etat  }</c:if>'>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Profil</label>
                          <input type="text" name="profil" class="form-control" value='<c:if test="${userG !=null }">${userG.profil  }</c:if>'>
                        </div>
                      </div>
                    </div>
                   <c:if test="${userG !=null }">                  
                   <button type="submit" class="btn btn-success pull-right">Modifier</button>
                   </c:if>
                   <c:if test="${userG == null }">
                   <button type="submit" class="btn btn-success pull-right">Envoyer</button>
                   </c:if>
                    
                    <div class="clearfix"></div>
                  </form>
                </div>
                
              </div>
            </div>
            <div class="col-md-12">
              <div class="card card-plain">
                <div class="card-header card-header-primary">
                  <h4 class="card-title mt-0"> Tableau des Utilisateurs</h4>
                  
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-hover">
                    <tr>
                    <th>Identifiant</th>
                    <th>Nom</th>
                    <th>Prenom</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Etat</th>
                    <th>Profil</th>
                    <th>Action</th>
                    <th>Action</th>
                    </tr>
                    <c:forEach items="${users }" var="u">
                    <tr>
                    <td>${u.id }</td>
                    <td>${u.nom }</td>
                    <td>${u.prenom }</td>
                    <td>${u.email }</td>
                    <td>${u.password }</td>
                    <td>${u.etat }</td>
                    <td>${u.profil }</td>
                    <td><a href="User?action=edit&idU=${u.id }">Editer</a></td>
                    <td><a href="User?action=delete&idU=${u.id }" onclick="if(!confirm('Voulez-vous supprimé ?')) return false;">Supprimer</a></td>
                    </tr>
                    </c:forEach>
                      </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <jsp:include page="../../footer.jsp"></jsp:include>