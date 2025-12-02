<?php
header("Content-Type: application/json; charset=utf-8");

// Recebe os dados JSON (somente o ID é necessário)
$dados = json_decode(file_get_contents("php://input"), true);

// 1. Verifica se o ID foi recebido
if (empty($dados["id_ator"])) {
    echo json_encode(["sucesso" => false, "mensagem" => "ID do Ator ausente."]);
    exit;
}

$id = (int)$dados["id_ator"];

/* ⚙️ CONEXÃO PDO COM O BANCO DE DADOS Atividade2 */
$host = "localhost";
$dbname = "Atividade2";
$usuario = "root";
$senha = "root";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $usuario, $senha, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

    // 2. Comando SQL de DELETE
    $sql = "DELETE FROM atores WHERE id_ator = :id";

    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(":id", $id, PDO::PARAM_INT);

    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        echo json_encode(["sucesso" => true, "mensagem" => "✅ Ator ID {$id} removido com sucesso!"]);
    } else {
        echo json_encode(["sucesso" => false, "mensagem" => "Nenhum registro encontrado com o ID {$id}."]);
    }
    exit;

} catch (PDOException $e) {
    echo json_encode(["sucesso" => false, "mensagem" => "Erro no banco de dados: " . $e->getMessage()]);
    exit;
}