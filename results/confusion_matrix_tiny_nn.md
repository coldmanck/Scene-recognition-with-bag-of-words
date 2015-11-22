<center>
<h1>Project 3 results visualization</h1>
<img src="confusion_matrix.png">

<br>
Accuracy (mean of diagonal of confusion matrix) is 0.201
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
<td>0.060</td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0210.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0087.jpg" width=114 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0175.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0110.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0131.jpg" width=119 height=75><br><small>Office</small></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0069.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0036.jpg" width=57 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0156.jpg" width=91 height=75><br><small>TallBuilding</small></td>
</tr>
<tr>
<td>Store</td>
<td>0.010</td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0250.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0126.jpg" width=88 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0009.jpg" width=100 height=75></td>
<td bgcolor=LightGreen></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0084.jpg" width=107 height=75><br><small>Office</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0029.jpg" width=63 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0033.jpg" width=95 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0057.jpg" width=100 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>Bedroom</td>
<td>0.130</td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0204.jpg" width=54 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0147.jpg" width=101 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0063.jpg" width=115 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0104.jpg" width=95 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0135.jpg" width=108 height=75><br><small>Office</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0074.jpg" width=100 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0092.jpg" width=116 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0160.jpg" width=111 height=75><br><small>OpenCountry</small></td>
</tr>
<tr>
<td>LivingRoom</td>
<td>0.060</td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0267.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0103.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0021.jpg" width=109 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0003.jpg" width=114 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0114.jpg" width=100 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0116.jpg" width=126 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0010.jpg" width=100 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0011.jpg" width=110 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>Office</td>
<td>0.070</td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0033.jpg" width=108 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0039.jpg" width=126 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0144.jpg" width=115 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0010.jpg" width=107 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0192.jpg" width=100 height=75><br><small>Kitchen</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0176.jpg" width=57 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0077.jpg" width=127 height=75><br><small>Forest</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0001.jpg" width=101 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>Industrial</td>
<td>0.030</td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0077.jpg" width=57 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0044.jpg" width=115 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0091.jpg" width=57 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0106.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Suburb_image_0009.jpg" width=113 height=75><br><small>Suburb</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Forest_image_0118.jpg" width=75 height=75><br><small>Forest</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0105.jpg" width=113 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0046.jpg" width=57 height=75><br><small>TallBuilding</small></td>
</tr>
<tr>
<td>Suburb</td>
<td>0.220</td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0209.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0099.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0074.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0003.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0102.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0140.jpg" width=98 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0175.jpg" width=113 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0107.jpg" width=113 height=75><br><small>Street</small></td>
</tr>
<tr>
<td>InsideCity</td>
<td>0.070</td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0261.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0259.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0140.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0089.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0115.jpg" width=89 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0069.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0077.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0023.jpg" width=75 height=75><br><small>Forest</small></td>
</tr>
<tr>
<td>TallBuilding</td>
<td>0.170</td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0304.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0336.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0059.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0127.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0121.jpg" width=118 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0117.jpg" width=102 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0080.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0044.jpg" width=75 height=75><br><small>LivingRoom</small></td>
</tr>
<tr>
<td>Street</td>
<td>0.380</td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0097.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0261.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0016.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0048.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0153.jpg" width=114 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0010.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0147.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0047.jpg" width=75 height=75><br><small>Highway</small></td>
</tr>
<tr>
<td>Highway</td>
<td>0.580</td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0129.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0073.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0085.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0078.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0022.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0141.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0014.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0087.jpg" width=75 height=75><br><small>OpenCountry</small></td>
</tr>
<tr>
<td>OpenCountry</td>
<td>0.380</td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0186.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0271.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0060.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0013.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0139.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0056.jpg" width=100 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0010.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0028.jpg" width=75 height=75><br><small>Highway</small></td>
</tr>
<tr>
<td>Coast</td>
<td>0.470</td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0267.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0190.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0051.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0005.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0117.jpg" width=71 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0125.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0012.jpg" width=75 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0047.jpg" width=75 height=75><br><small>Highway</small></td>
</tr>
<tr>
<td>Mountain</td>
<td>0.180</td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0180.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0099.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0006.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0055.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0017.jpg" width=100 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0063.jpg" width=128 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0027.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0001.jpg" width=75 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>Forest</td>
<td>0.200</td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0055.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0265.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0079.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0008.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0014.jpg" width=44 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0094.jpg" width=64 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0070.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0040.jpg" width=75 height=75><br><small>Coast</small></td>
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


