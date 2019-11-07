<?php
    session_start();
        require_once '../../../bd/connection_bd.php';
        include '../../../includes/header.php';
        
        if (isset($_SESSION['user'])){
            $userSession = $_SESSION['user'];
            $select = mysqli_query($conexao,"SELECT * FROM users WHERE u_user ='".$userSession["u_user"]."'");

            if($userSession['u_type']==2){
                include '../../../includes/navbar_admin.php';
            }else if($userSession['u_type']==1){
                include '../../../includes/navbar_after.php';
                }
            }else{
            include '../../../includes/navbar.php';
        }
?>
<html>
<body class="fadeInPages" style="background-size: 100%;background-image: url(../../../images/fundo.png);">
    <center>
        <div class="container fundobranco" style="margin-top: 50px;">
        <center><h1 class="fonteLabel">Visualização de Usuários</h1></center>
        <table class="table table-striped table-dark" border="1">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Nome</th>
                <th scope="col">Email</th>
                <th scope="col">Ação</th>
            </tr>
            <tbody>
            <?php
                $busca=mysqli_query($conexao,"SELECT * FROM users");
                $arrUser=mysqli_fetch_all($busca, MYSQLI_ASSOC);
                
            
                foreach($arrUser as $chave => $valor){
                    echo "<tr>";
                    echo "<th>".$valor["id_user"]."</th>";
                    echo "<th>".$valor["u_user"]."</th>";
                    echo "<th>".$valor["u_email"]."</th>";
                    echo "<th>";
                    echo "<a href='../../actions/delete.php?codigo=".$valor["id_user"]."'>Excluir</a>";
                    echo "</th>";
                    echo "</tr>";
                }
                mysqli_close($conexao);
            ?>
            </tbody>
            </thead>
        </table>
        </div>
    </center>
</body>
</html>