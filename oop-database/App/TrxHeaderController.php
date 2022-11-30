<?php
namespace OOP\App;
use OOP\App\TrxHeaders;

class TrxHeaderController
{
    public static $header;

    public function __construct()
    {
        self::$header = new TrxHeaders;
    }

    public function index()
    {
        print_r(self::$header->getAll());
    }

    public function show($id)
    {
        print_r(self::$header->find($id));
    }

    public function add()
    {
        $insert = [
            'datetime_trx' => date('Y-m-d H:i:s'),
            'trx_info_id' => 1,
            'total_paid' => 90000,
            'discount' => 0,
            'total' => 90000,
            'charge' => 0,
            'created_at' => date('Y-m-d H:i:s')
        ];
        print_r(self::$header->insert($insert));
    }

    public function update($id){
        $update = [
            // 'id_header' => 4,
            'trx_info_id' => 1,
            'total_paid' => 234234,
            'discount' => 0,
            'total' => 234234,
            'charge' => 0,
            'updated_at' => date('Y-m-d H:i:s')
        ];

        print_r(self::$header->update($update, $id));
    
    }

    public function delete($id)
    {
        print_r(self::$header->delete(($id)));
    }
}
