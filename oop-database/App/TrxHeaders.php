<?php
namespace OOP\App;
use OOP\App\Database;

class TrxHeaders extends Database
{

    public function getAll()
    {
        $statement = self::$conn->prepare("select * from header_trx");
        $statement->execute();

        return $statement->fetchAll(\PDO::FETCH_OBJ);
    }

    public function findArr($id)
    {
        $statement = self::$conn->prepare("select * from header_trx where id_header=$id");
        $statement->execute();

        return $statement->fetch();
    }

    public static function find($id)
    {
        $statement = self::$conn->prepare("select * from header_trx where id_header=:id");
        $statement->execute(['id' => $id]);

        return $statement->fetch(\PDO::FETCH_OBJ);
    }

    public function insert($data)
    {
        $statement = self::$conn->prepare("INSERT INTO header_trx(trx_info_id, datetime_trx, total_paid, discount, total, charge, created_at)
                                           VALUES (:trx_info_id, :datetime_trx, :total_paid, :discount, :total, :charge, :created_at)");

        return $statement->execute($data);
    }

    public function update($data, $id)
    {
        $statement = self::$conn->prepare("UPDATE header_trx SET trx_info_id = :trx_info_id, total_paid = :total_paid, discount=:discount, total = :total, charge = :charge, updated_at = :updated_at WHERE id_header = :id_header");
        return $statement->execute(array_merge($data, ['id_header'=>$id]));
    }

    public function delete($id)
    {
        $statement = self::$conn->prepare("DELETE FROM header_trx WHERE id_header = :id");
        return $statement->execute(['id'=>$id]);
    }
}



try {
    $trxheader  = new TrxHeaders();

    $update = [
        // 'id_header' => 10,
        'trx_info_id' => 1,
        'total_paid' => 20000,
        'discount' => 0,
        'total' => 20000,
        'charge' => 0,
        'updated_at' => date('Y-m-d H:i:s')
    ];

    $trxheader->update($update, 3);
// 
    // $trxheader->delete(8);


    // $data = $trxheader->find(4);
    // // echo $data->datetime_trx;



    // $data2 = $trxheader->findArr(2);
    // // echo $data2['total_paid']; //untuk menampilkan array menggunakan syntax sebagai berikut


    // // casting
    // $data3 = $trxheader->findArr(1);
    // // var_dump((object) $data3);
    // $insert = [
    //     'datetime_trx'=>date('Y-m-d H:i:s'),
    //     'trx_info_id'=>1,
    //     'total_paid'=>90000,
    //     'discount'=>0,
    //     'total'=>90000,
    //     'charge'=>0, 
    //     'created_at'=>date('Y-m-d H:i:s')
    // ];

    // echo date('Y-m-f H:i:s');

    // $trxheader->insert($insert);



} catch (\Throwable $th) {
    echo $th;
}
