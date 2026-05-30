// written by groverbuger for g3d
// september 2021
// MIT license

// this vertex shader is what projects 3d vertices in models onto your 2d screen

#include "baseheader"
#ifdef VERTEX
    // the vertex normal attribute must be defined, as it is custom unlike the other attributes

    vec4 default_position(mat4 transformProjection, vec4 vertexPosition) {
        // calculate the positions of the transformed coordinates on the screen
        // save each step of the process, as these are often useful when writing custom fragment shaders
        mat4 modelViewMatrix = viewMatrix * modelMatrix;
        worldPosition = modelMatrix * vertexPosition;
        if (billboard) {
            modelViewMatrix[0][0] = billboardScale.x;
            modelViewMatrix[0][1] = 0.0; 
            modelViewMatrix[0][2] = 0.0; 

            // if (spherical == 1)
            // {
            //     // Second colunm.
                modelViewMatrix[1][0] = 0.0; 
                // Magic Number: Why 0.97?
                modelViewMatrix[1][1] = billboardScale.y*0.97;
                modelViewMatrix[1][2] = 0.0; 
            // }

            // Thrid colunm.
            modelViewMatrix[2][0] = 0.0; 
            modelViewMatrix[2][1] = 0.0; 
            modelViewMatrix[2][2] = 1.0; 
        }
        viewPosition = modelViewMatrix * vertexPosition;
        // TODO: Vertex Snapping would be cool
        viewPosition = viewPosition + vec4(vec2(20),vec2(0));
        screenPosition = projectionMatrix * viewPosition;
        // save some data from this vertex for use in fragment shaders
        vertexNormal = VertexNormal;
        vertexColor = VertexColor;

        // for some reason models are flipped vertically when rendering to a canvas
        // so we need to detect when this is being rendered to a canvas, and flip it back
        if (isCanvasEnabled) {
            screenPosition.y *= -1.0;
        }

        return screenPosition;
    }

    #ifndef CUSTOM_POSITION
        vec4 position(mat4 transformProjection, vec4 vertexPosition) {
            return default_position(transformProjection, vertexPosition);
        }
    #endif
#endif