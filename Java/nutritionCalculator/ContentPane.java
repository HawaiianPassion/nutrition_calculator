/**
 * Author: Ryson Asuncion
 * Date Created: June 17, 2014
 * 
 * Last Updated: June 28, 2014 
 */

package nutritionCalculator;

import java.awt.BorderLayout;
import java.awt.Color;

import javax.swing.BorderFactory;
import javax.swing.JPanel;

public class ContentPane extends JPanel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Method: ContentPane()
	 * 
	 * Description: Creates the darker red border around the peach colored panel
	 * 				by laying the MainPane on top of this pane
	 * 
	 */
	public ContentPane() {
		super(new BorderLayout());
		
		setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
		setBackground(new Color(100,0,0));
		
		add(new MainPane());
	}

	


}
