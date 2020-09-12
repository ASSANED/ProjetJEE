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
                  <form method="post" action=Machine>
                   
                      <div class="col-md-5">
                        <div class="form-group">
                          <label class="bmd-label-floating">Company (disabled)</label>
                          <input type="text" class="form-control" disabled>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label class="bmd-label-floating">Adresse IP</label>
                          <input type="text" name="adip" class="form-control">
                        </div>
                      </div>
                      <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Adresse Machine </label>
                          <input type="text" name="admac" class="form-control">
                        </div>
                      </div>
                    </div>
                    
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Marque </label>
                          <input type="text" name="marque" class="form-control">
                        </div>
                      </div>
                    </div>
                    
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Salle </label>
                          <select name="salle" class="form-control">
                          <option value="">Faites votre choix</option>
                          <c:forEach items="${salles }" var="s">                
		                    <option value="${s.id }">${s.nom }</option>		                    		                   
                          </c:forEach>
                          </select>
                        </div>
                      </div>
                    </div>
                   
                    <button type="submit" class="btn btn-success pull-right">Envoyer</button>
                    <div class="clearfix"></div>
                  </form>
                </div>
                
              </div>
            </div>
            <div class="col-md-12">
              <div class="card card-plain">
                <div class="card-header card-header-primary">
                  <h4 class="card-title mt-0"> Tableau des Machines</h4>
                  
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-hover">
                    <tr>
                    <th>Identifiant</th>
                    <th>Adresse IP</th>
                    <th>Adresse MAC</th>
                    <th>Marque</th>
                    <th>Salle</th>
                    <th>Utilisateur</th>
                    <th>Action</th>
                    <th>Action</th>
                    </tr>
                    <c:forEach items="${machines }" var="mac">
                    <tr>
                    <td>${mac.id }</td>
                    <td>${mac.ipadresse }</td>
                    <td>${mac.macadresse }</td>
                    <td>${mac.marque }</td>
                     <td>${mac.salle.nom }</td>
                    <td>${mac.user.prenom } ${mac.user.nom }</td>
                    <td>Editer</td>
                    <td>Supprimer</td>
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