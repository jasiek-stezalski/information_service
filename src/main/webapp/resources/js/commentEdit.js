function showEditArea(id1, id2) {
    document.getElementById(id1).style.display="none";
    document.getElementById(id2).style.display = 'block';
}

function showEditArea(id1, id2, id3) {
    document.getElementById(id1).style.display="none";
    document.getElementById(id2).style.display = 'block';
    document.getElementById(id3).style.display = 'inline';
}

function hideEditArea(id1, id2, id3) {
    document.getElementById(id1).style.display="inline";
    document.getElementById(id2).style.display = 'none';
    document.getElementById(id3).style.display = 'none';
}