<center>
<h1>Project 3 results visualization</h1>
<img src="confusion_matrix.png">

<br>
Accuracy (mean of diagonal of confusion matrix) is 0.614
<p>

<table border=0 cellpadding=4 cellspacing=1>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
<tr>
<td>Kitchen</td>
<td>0.570</td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0079.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0103.jpg" width=103 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0166.jpg" width=111 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0118.jpg" width=57 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0023.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0157.jpg" width=90 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0123.jpg" width=114 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0021.jpg" width=100 height=75><br><small>Office</small></td>
</tr>
<tr>
<td>Store</td>
<td>0.440</td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0072.jpg" width=74 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0145.jpg" width=101 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0076.jpg" width=54 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0114.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0124.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0061.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0070.jpg" width=101 height=75><br><small>Forest</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0141.jpg" width=125 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<td>Bedroom</td>
<td>0.350</td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0193.jpg" width=105 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0028.jpg" width=97 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0090.jpg" width=108 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0033.jpg" width=101 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0084.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0150.jpg" width=100 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0170.jpg" width=93 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0087.jpg" width=50 height=75><br><small>Store</small></td>
</tr>
<tr>
<td>LivingRoom</td>
<td>0.180</td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0220.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0038.jpg" width=99 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0093.jpg" width=116 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0116.jpg" width=51 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0128.jpg" width=115 height=75><br><small>Kitchen</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0108.jpg" width=133 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0142.jpg" width=100 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0043.jpg" width=100 height=75><br><small>Street</small></td>
</tr>
<tr>
<td>Office</td>
<td>0.900</td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0184.jpg" width=109 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0078.jpg" width=116 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0114.jpg" width=117 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0168.jpg" width=112 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0132.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0117.jpg" width=114 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0155.jpg" width=118 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0148.jpg" width=100 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>Industrial</td>
<td>0.400</td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0078.jpg" width=105 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0034.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0045.jpg" width=61 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0040.jpg" width=135 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Forest_image_0017.jpg" width=75 height=75><br><small>Forest</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0002.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0001.jpg" width=67 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0125.jpg" width=46 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<td>Suburb</td>
<td>0.960</td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0151.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0224.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0046.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0119.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0116.jpg" width=126 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0138.jpg" width=100 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0041.jpg" width=113 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0053.jpg" width=113 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>InsideCity</td>
<td>0.470</td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0242.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0018.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0104.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0105.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0060.jpg" width=57 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0086.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0095.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0041.jpg" width=75 height=75><br><small>TallBuilding</small></td>
</tr>
<tr>
<td>TallBuilding</td>
<td>0.690</td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0148.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0331.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0044.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0080.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0102.jpg" width=100 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0123.jpg" width=120 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0127.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0083.jpg" width=75 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<td>Street</td>
<td>0.540</td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0173.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0005.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0136.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0012.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0084.jpg" width=110 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0043.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0105.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0045.jpg" width=75 height=75><br><small>TallBuilding</small></td>
</tr>
<tr>
<td>Highway</td>
<td>0.820</td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0120.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0049.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0105.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0068.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0080.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0004.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0026.jpg" width=75 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0136.jpg" width=75 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>OpenCountry</td>
<td>0.380</td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0398.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0130.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0120.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0112.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0140.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0096.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0038.jpg" width=75 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0122.jpg" width=75 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>Coast</td>
<td>0.810</td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0034.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0326.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0077.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0056.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0136.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0122.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0114.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0036.jpg" width=75 height=75><br><small>Suburb</small></td>
</tr>
<tr>
<td>Mountain</td>
<td>0.810</td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0276.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0226.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0031.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0037.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0048.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0040.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0091.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0081.jpg" width=75 height=75><br><small>Suburb</small></td>
</tr>
<tr>
<td>Forest</td>
<td>0.890</td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0055.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0189.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0138.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0127.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0046.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0001.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0110.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0124.jpg" width=75 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
</table>
</center>


