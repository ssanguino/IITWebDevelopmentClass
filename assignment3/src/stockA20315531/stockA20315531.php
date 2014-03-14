<?php
	/* 
    Plugin Name: Stock Market Helper 
    Plugin URI: http://www.linkedin.com/pub/sergio-sanguino-serrano/40/807/392
    Description: Plugin for accessing the Yahoo API for stock information
    Author: Sergio Sanguino Serrano
    Version: 1.0 
    Author URI: http://www.linkedin.com/pub/sergio-sanguino-serrano/40/807/392
    License: GPLv2
	*/ 

    /*  Copyright 2013 Sergio Sanguino Serrano (email: ssanguin@hawk.iit.edu)
	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License, version 2, as 
	published by the Free Software Foundation.
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
	*/

define('STOCK_OPTION', 'wp-stock-option');

//Custom tag
function drawStockPriceDiv() 
{
	$STID = get_option(STOCK_OPTION);
	if ($STID == NULL) $STID = 'goog';
   	$query = "http://query.yahooapis.com/v1/public/yql?env=store://datatables.org/alltableswithkeys&q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20($STID)";
   	$xml = file_get_contents($query);
   	$data = new SimpleXMLElement($xml);
   	$quotes = $data->results->quote;
   	if ($quotes.length > 0) {
   		$html .= '<table>';
   		$html .= '<tr><th>Name</th><th>Ask</th><th>Bid</th><th>Change</th></tr>';
		foreach ($quotes as $quote) {
			$html .= '<tr>';
			$stockName = (string) $quote->Name;
			$stockAsk = (string) $quote->Ask;
			$stockBid = (string) $quote->Bid;
			$stockChange = (string) $quote->Change;
			$html .= "<td>$stockName</td><td>$stockAsk</td><td>$stockBid</td><td>$stockChange</td></tr>";
		}
		$html .= '</table>';
		print $html;
   	} else {
   		print '<span>You did not select any valid stock symbols!</span>';
   	}
   	
}


/********************************************************************************************
Admin
*/
function stock_plugin_menu() {
	add_options_page('Stock Options', 'Stock', 'manage_options', 'stock-unique-id',
	 'stock_plugin_menu_context');
}

add_action ('admin_menu', 'stock_plugin_menu');

// Displays the form so that the user can choose which stocks to monitor.
function stock_plugin_menu_context() {
	//user can modify options.
	if (!current_user_can('manage_options')) {
		wp_die('You do not have enough permissions to do this.');
	}

	$data_field_name = 'settings_stock_stid';
	$opt_val = get_option(STOCK_OPTION);

	if (isset($_POST[$data_field_name])) {
		$opt_val = $_POST[$data_field_name];
		$opt_val = str_replace(' ', '', $opt_val);
		$values = split(',', $opt_val);
		$result = "";
		$first = true;
		foreach ($values as $value) {
			if (!$first){
				$result .= ",";
			}
			$result .= "'$value'";
			$first = false;
		}
		$opt_val = $result;
		update_option (STOCK_OPTION, $result);
		echo '<div class="updated"><p><strong>Settings saved</strong></p></div>';
	}

	echo '<div class="wrap">';
	echo "<h2>Stock Plugin Settings</h2>";
	echo '<form name="form1" method="post" action="">';
	echo '<p>Introduce the stocks you would like to see, separated by commas</p>';
	echo '<input type="text" name="'.$data_field_name.'" value="'.$opt_val.'" size="30">';
	echo '</p><hr />';
	echo '<p class="submit">';
	echo '<input type="submit" name="Submit" class="button-primary" value="Save Changes" />';
	echo '</p>';
	echo '</form>';
	echo '</div>';
}

?>