<?php
header("Content-Type: application/json; charset=utf-8");

// 1. Recebe os dados JSON (incluindo o ID)
$dados = json_decode(file_get_contents("php://input"), true);

// 2. Verifica campos obrigatórios (ID e Nome)
// Assumindo que o campo ID da tabela LIVROS se chama 'id_livro'
if (empty($dados["id_livro"]) || empty($dados["nome"])) {
    echo json_encode(["sucesso" => false, "mensagem" => "ID do Livro e Nome são obrigatórios para alteração."]);
    exit;
}

// 3. Captura e normaliza os dados
$id        = (int)$dados["id_livro"];
$nome      = trim($dados["nome"]);
$descricao = isset($dados["descricao"]) ? trim($dados["descricao"]) : "";
$autor     = isset($dados["autor"]) ? trim($dados["autor"]) : "";
$genero    = trim($dados["genero"]);

/* ======================================================
   ⚙️ CONEXÃO PDO COM O BANCO DE DADOS Atividade2
   ====================================================== */
$host = "localhost";
$dbname = "Atividade2";
$usuario = "root";
$senha = "root";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $usuario, $senha, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

    // 4. Comando SQL de UPDATE para a tabela LIVROS
    // CONFIRME se o nome da tabela no seu banco é "LIVROS" ou "livros"
    $sql = "UPDATE LIVROS SET 
                nome = :nome, 
                descricao = :descricao, 
                autor = :autor, 
                genero = :genero 
            WHERE id_livro = :id";

    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(":id", $id);
    $stmt->bindParam(":nome", $nome);
    $stmt->bindParam(":descricao", $descricao);
    $stmt->bindParam(":autor", $autor);
    $stmt->bindParam(":genero", $genero);

    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        echo json_encode(["sucesso" => true, "mensagem" => "✅ Livro ID {$id} alterado com sucesso!"]);
    } else {
        echo json_encode(["sucesso" => false, "mensagem" => "Nenhum dado alterado (ID não encontrado ou dados iguais)."]);
    }
    exit;

} catch (PDOException $e) {
    echo json_encode(["sucesso" => false, "mensagem" => "Erro no banco de dados: " . $e->getMessage()]);
    exit;
}