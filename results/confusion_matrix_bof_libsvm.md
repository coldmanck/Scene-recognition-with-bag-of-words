<center>
<h1>Project 3 results visualization</h1>
<img src="confusion_matrix.png">

<br>
Accuracy (mean of diagonal of confusion matrix) is 0.615
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
<td>0.540</td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0083.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0004.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0072.jpg" width=107 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0009.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0143.jpg" width=110 height=75><br><small>Office</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0119.jpg" width=108 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0075.jpg" width=107 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0044.jpg" width=90 height=75><br><small>InsideCity</small></td>
</tr>
<tr>
<td>Store</td>
<td>0.490</td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0066.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0119.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0015.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0086.jpg" width=111 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0122.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0096.jpg" width=78 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0056.jpg" width=100 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0090.jpg" width=112 height=75><br><small>InsideCity</small></td>
</tr>
<tr>
<td>Bedroom</td>
<td>0.360</td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0216.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0197.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0156.jpg" width=99 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0119.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0025.jpg" width=113 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0057.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0081.jpg" width=107 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0153.jpg" width=114 height=75><br><small>LivingRoom</small></td>
</tr>
<tr>
<td>LivingRoom</td>
<td>0.340</td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0030.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0193.jpg" width=101 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0086.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0088.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0056.jpg" width=113 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0140.jpg" width=103 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0022.jpg" width=100 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0136.jpg" width=100 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>Office</td>
<td>0.750</td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0053.jpg" width=111 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0090.jpg" width=107 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0103.jpg" width=104 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0150.jpg" width=92 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0020.jpg" width=113 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0111.jpg" width=88 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0089.jpg" width=92 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0012.jpg" width=87 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>Industrial</td>
<td>0.470</td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0031.jpg" width=99 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0097.jpg" width=57 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0139.jpg" width=55 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0132.jpg" width=51 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0062.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0136.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0101.jpg" width=113 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0108.jpg" width=100 height=75><br><small>LivingRoom</small></td>
</tr>
<tr>
<td>Suburb</td>
<td>0.920</td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0090.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0218.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0102.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0147.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0102.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0114.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0154.jpg" width=113 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0155.jpg" width=113 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>InsideCity</td>
<td>0.500</td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0242.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0070.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0097.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0104.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0087.jpg" width=112 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0121.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0001.jpg" width=75 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0007.jpg" width=75 height=75><br><small>TallBuilding</small></td>
</tr>
<tr>
<td>TallBuilding</td>
<td>0.570</td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0233.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0011.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0059.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0117.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0126.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0007.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0040.jpg" width=75 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0048.jpg" width=75 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<td>Street</td>
<td>0.610</td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0043.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0004.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0138.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0141.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0140.jpg" width=98 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0038.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0109.jpg" width=75 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0074.jpg" width=75 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>Highway</td>
<td>0.820</td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0073.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0016.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0053.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0056.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0005.jpg" width=114 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0058.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0001.jpg" width=75 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0020.jpg" width=75 height=75><br><small>Street</small></td>
</tr>
<tr>
<td>OpenCountry</td>
<td>0.530</td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0363.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0342.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0054.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0082.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0021.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Forest_image_0102.jpg" width=75 height=75><br><small>Forest</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0064.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0027.jpg" width=75 height=75><br><small>Highway</small></td>
</tr>
<tr>
<td>Coast</td>
<td>0.710</td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0189.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0326.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0079.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0029.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0034.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0022.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0113.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0017.jpg" width=75 height=75><br><small>InsideCity</small></td>
</tr>
<tr>
<td>Mountain</td>
<td>0.730</td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0345.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0208.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0032.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0049.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0162.jpg" width=113 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0012.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0075.jpg" width=75 height=75><br><small>Suburb</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0082.jpg" width=75 height=75><br><small>Suburb</small></td>
</tr>
<tr>
<td>Forest</td>
<td>0.890</td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0003.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0162.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0044.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0059.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0076.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0057.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0117.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0010.jpg" width=75 height=75><br><small>OpenCountry</small></td>
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


