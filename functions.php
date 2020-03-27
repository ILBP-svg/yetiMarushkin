<?php
$is_auth = rand(0, 1);

$user_name = 'Алексей'; // укажите здесь ваше имя

$categories = ['boards'=> 'Доски и лыжи', 'attachment'=> 'Крепления', 'boots'=> 'Ботинки', 'clothing'=> 'Одежда', 'tools'=> 'Инструменты', 'other'=> 'Разное'];
$lots = 
	[
		['a'=> '2014 Rossignol District Snowboard', 'b'=> 'Доски и лыжи', 'c'=> 10999, 'd'=> 'img/lot-1.jpg'],
		['a'=> 'DC Ply Mens 2016/2017 Snowboard', 'b'=> 'Доски и лыжи', 'c'=> 159999, 'd'=> 'img/lot-2.jpg'],
		['a'=> 'Крепления Union Contact Pro 2015 года размер L/XL', 'b'=> 'Крепления', 'c'=> 8000, 'd'=> 'img/lot-3.jpg'],
		['a'=> 'Ботинки для сноуборда DC Mutiny Charocal', 'b'=> 'Ботинки', 'c'=> 10999, 'd'=> 'img/lot-4.jpg'],
		['a'=> 'Куртка для сноуборда DC Mutiny Charocal', 'b'=> 'Одежда', 'c'=> 7500, 'd'=> 'img/lot-5.jpg'],
		['a'=> 'Маска Oakley Canopy', 'b'=> 'Разное', 'c'=> 5400, 'd'=> 'img/lot-6.jpg'],
	];

function format_number($number, $rub) 
	{
		$number = ceil($number);
		$number = number_format($number, 0, ' ', ' ');
		return $rub ? $number."<b class='rub'>р</b>":$number;
		if ($number >= 1000)
			{
				$C=number_format($number, 0, ' ', ' ');
			}
		else 
			{
				$C=$number;
			}
	};

function include_template($name, $data) 
	{
		$name = 'templates/' . $name;
		$result = '';
		if (!file_exists($name)) 
			{
				return $result;
			}
		ob_start();
		extract($data);
		require $name;
		$result = ob_get_clean();
		return $result;
	}

function LTime()
	{
		$Now=strtotime("now");
		$Tomorrow=strtotime("tomorrow");
		$R=$Tomorrow-$Now;
		$H=floor($R/3600);
		$M=floor(($R-$H*3600)/60);
		$T=sprintf("%02d:%02d", $H, $M);
		return $T;
	}
?>
