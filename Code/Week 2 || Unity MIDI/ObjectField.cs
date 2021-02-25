using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MidiJack;

public class ObjectField : MonoBehaviour
{
    public GameObject originalObject;

    public Light lightA, lightB; 

    private List<GameObject> clonedObjects = new List<GameObject>();
    private float time = 0;
    
    // Start is called before the first frame update
    void Start()
    {
        for(int x = -10; x <= 10; x++)
        {

            for(int z = -10; z <= 10; z++)
            {
                GameObject clonedObject = Instantiate(
                    originalObject, 
                    new Vector3(x, 0, z), 
                    Quaternion.identity
                    );

                    clonedObject.transform.parent = this.transform;
                    clonedObject.SetActive(true);

                    clonedObjects.Add(clonedObject);
            }

        }

        
    }

    // Update is called once per frame
    void Update()
    {
        float waveSize = MidiMaster.GetKnob(0x5D, 0) * 10 + 1;
        float waveHeight = MidiMaster.GetKnob(0x49, 0) * 2;
        float speed = MidiMaster.GetKnob(0x4B, 0) / 10;

        time += speed;

        foreach (GameObject clonedObject in clonedObjects) 
        {
            float x = clonedObject.transform.position.x;
            float y = Mathf.Sin(x / waveSize + time) * waveHeight;
            float z = clonedObject.transform.position.z;

            clonedObject.transform.SetPositionAndRotation(
                new Vector3(x, y, z),
                Quaternion.identity
            );
        }

        bool randomize = MidiMaster.GetKeyDown(0x41);

        if(randomize) {
            float randomHueA = Random.Range(0f, 1f);
            float randomHueB = Random.Range(0f, 1f);
            float randomSatA = Random.Range(0f, 1f);
            float randomSatB = Random.Range(0f, 1f);

            lightA.color = Color.HSVToRGB(randomHueA, randomSatA, 1f);
            lightB.color = Color.HSVToRGB(randomHueB, randomSatB, 1f);

        }
    }
}
