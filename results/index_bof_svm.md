<center>
<h1>Project 3 results visualization</h1>
<img src="confusion_matrix.png">

<br>
Accuracy (mean of diagonal of confusion matrix) is 0.616
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
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0086.jpg" width=114 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0132.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0062.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0056.jpg" width=99 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0104.jpg" width=101 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0110.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0123.jpg" width=114 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0178.jpg" width=43 height=75><br><small>LivingRoom</small></td>
</tr>
<tr>
<td>Store</td>
<td>0.450</td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0001.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0133.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0031.jpg" width=109 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0036.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0068.jpg" width=74 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0073.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0003.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0138.jpg" width=100 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>Bedroom</td>
<td>0.470</td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0126.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0106.jpg" width=101 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0088.jpg" width=57 height=76></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0035.jpg" width=115 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0080.jpg" width=132 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0047.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0118.jpg" width=114 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0082.jpg" width=121 height=75><br><small>LivingRoom</small></td>
</tr>
<tr>
<td>LivingRoom</td>
<td>0.310</td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0036.jpg" width=94 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0019.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0094.jpg" width=64 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0140.jpg" width=117 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0045.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0122.jpg" width=101 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0092.jpg" width=101 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0117.jpg" width=114 height=75><br><small>Office</small></td>
</tr>
<tr>
<td>Office</td>
<td>0.760</td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0189.jpg" width=94 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0154.jpg" width=115 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0124.jpg" width=104 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0067.jpg" width=117 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0071.jpg" width=112 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0057.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0019.jpg" width=101 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0180.jpg" width=113 height=75><br><small>LivingRoom</small></td>
</tr>
<tr>
<td>Industrial</td>
<td>0.480</td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0292.jpg" width=101 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0004.jpg" width=117 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0038.jpg" width=94 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0133.jpg" width=111 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0132.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0017.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0046.jpg" width=57 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0060.jpg" width=111 height=75><br><small>OpenCountry</small></td>
</tr>
<tr>
<td>Suburb</td>
<td>0.880</td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0144.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0047.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0088.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0026.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Forest_image_0017.jpg" width=75 height=75><br><small>Forest</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0018.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0046.jpg" width=113 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0074.jpg" width=113 height=75><br><small>OpenCountry</small></td>
</tr>
<tr>
<td>InsideCity</td>
<td>0.470</td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0147.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0114.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0097.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0111.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0095.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0008.jpg" width=89 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0066.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0023.jpg" width=75 height=75><br><small>TallBuilding</small></td>
</tr>
<tr>
<td>TallBuilding</td>
<td>0.610</td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0089.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0144.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0123.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0053.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0042.jpg" width=105 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0159.jpg" width=60 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0107.jpg" width=75 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0100.jpg" width=75 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>Street</td>
<td>0.620</td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0098.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0019.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0089.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0136.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0032.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0096.jpg" width=57 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0091.jpg" width=75 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0045.jpg" width=75 height=75><br><small>LivingRoom</small></td>
</tr>
<tr>
<td>Highway</td>
<td>0.810</td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0010.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0120.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0030.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0108.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0047.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0017.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0029.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0032.jpg" width=75 height=75><br><small>Street</small></td>
</tr>
<tr>
<td>OpenCountry</td>
<td>0.590</td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0143.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0286.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0022.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0013.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0059.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0009.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0084.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0005.jpg" width=75 height=75><br><small>Forest</small></td>
</tr>
<tr>
<td>Coast</td>
<td>0.680</td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0320.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0311.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0107.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0090.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0118.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0052.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0081.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0114.jpg" width=75 height=75><br><small>OpenCountry</small></td>
</tr>
<tr>
<td>Mountain</td>
<td>0.600</td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0313.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0250.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0122.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0041.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0008.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0023.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0004.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0030.jpg" width=75 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>Forest</td>
<td>0.940</td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0321.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0184.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0110.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0131.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0010.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0057.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0128.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0021.jpg" width=75 height=75><br><small>Mountain</small></td>
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


