using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(MeshFilter))]

public class MeshGenerator : MonoBehaviour
{
    Mesh mesh;

    Vector3[] vertices;
    int[] triangles;

    public int xSize = 20;
    public int zSize = 20; 
    public float scale = 20f;
    public float offsetX = 5f;
    public float offsetZ = 5f;
    public float heightMultiplier = 2f;

    // Start is called before the first frame update

    void Update()
    {
        mesh = new Mesh();
        GetComponent<MeshFilter>().mesh = mesh;
    
        CreateShape();
        UpdateMesh();
    }

// Create a grid of squares consisting of two triangles per square as the base of the terrain. //
void CreateShape()
{
    vertices = new Vector3[(xSize + 1) * (zSize + 1)];


    for (int i = 0, z = 0; z <= zSize; z++)
    {
        for (int x = 0; x <= xSize; x++)
        {
            float y = CalculateHeight(x, z) * heightMultiplier;
            vertices[i] = new Vector3(x, y, z);
            i++;
        }

    }

    triangles = new int[xSize * zSize * 6];

    int vert = 0;
    int tris = 0;

    for (int z = 0; z < zSize; z++)
    {
        for(int x = 0; x < xSize; x++ )
        {
            triangles[tris + 0] = vert + 0;
            triangles[tris + 1] = vert + xSize + 1;
            triangles[tris + 2] = vert + 1;
            triangles[tris + 3] = vert + 1;
            triangles[tris + 4] = vert + xSize + 1;
            triangles[tris + 5] = vert + xSize + 2;

            vert++;
            tris += 6;
        }
        vert++;
    }
}
// Calculate perlin noise values that map to the height of the meshes triangles //
float CalculateHeight (int x, int z)
{
    float xCoord = (float)x / xSize * scale + offsetX;
    float zCoord = (float)z / zSize * scale + offsetZ;

    float noise = Mathf.PerlinNoise(xCoord, zCoord);
    return noise;
}

void UpdateMesh()
{
    mesh.Clear();

    mesh.vertices = vertices;
    mesh.triangles = triangles;

    mesh.RecalculateNormals();
}

}