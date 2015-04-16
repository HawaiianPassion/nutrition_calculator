/**
 * Author: Ryson Asuncion
 * Date Created: June 17, 2014
 * 
 * Last Updated: June 22, 2014 
 */

package nutritionCalculator;

import javax.swing.JFrame;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;

public class CarbCyclingCalculator {

	/**
	 * Method: main()
	 * 
	 * Description: Creates and runs separate threads for calculation and displaying the interface
	 * 
	 */
    public static void main(String[] args) {
        //Schedule a job for the event dispatch thread:
        //creating and showing this application's GUI.
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                //Turn off metal's use of bold fonts
	        UIManager.put("swing.boldMetal", Boolean.FALSE);
	        JFrame frame = new JFrame("Carb Cycling Calculator");
	        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	        //Add contents to the window.
	        frame.add(new ContentPane());

	        //Make the window unable to resize
	        frame.setResizable(false);
	        
	        //Display the window.
	        frame.pack();
	        frame.setVisible(true);
            }
        });
    }

}
