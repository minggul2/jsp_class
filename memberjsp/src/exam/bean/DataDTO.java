package exam.bean;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class DataDTO {
	//bean, jsp �±� name, ����Ŭ �÷����� �׻� ���ƾ���
	
	@NonNull private int x;
	private int y;
	
}
	