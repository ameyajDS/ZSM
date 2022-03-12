using System.Collections;
using System.Collections.Generic;

public interface IObjectProvider
{
    ICollection GetObjectList();
    void RemoveObject(object obj);
    object AddObject();
    object GetObjectAt(int index);
    void SetObjectAt(int index, object obj);
}
